//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "MooseTypes.h"
#include "Units.h"
#include "libmesh/point.h"
#include <memory>
#include <string>

class InputParameters;
namespace libMesh
{
template <typename>
class TensorValue;
typedef TensorValue<Real> RealTensorValue;
}

class MooseCoordTransform
{
public:
  /**
   * Default constructor. If no other methods are called to set rotation, translation, or scaling,
   * then when \p operator() is called the result will be the passed-in point, e.g. no
   * transformation will occur
   */
  MooseCoordTransform();

  /**
   * Construct this object from the provided input parameters. See the \p validParams implementation
   * for valid parameters
   */
  MooseCoordTransform(const InputParameters & params);

  ~MooseCoordTransform();

  /**
   * Describes the parameters this object can take to setup transformations. These include
   * parameters related to coordinate system type, rotation, and scaling
   */
  static InputParameters validParams();

  /**
   * Transforms a point from our domain into the reference domain. The sequence of transformations
   * applied is:
   * 1. Rotation
   * 2. Scaling
   * 3. Translation
   * 4. Potential collapse of XYZ coordinates into RZ or RSPHERICAL coordinates depending on the
   *    destination coordinate system (if there is no destination coordinate system or the
   *    destination coordinate system is XYZ, then nothing happens in this stage)
   * @param point A point in our domain
   * @return The corresponding position in the reference domain
   */
  libMesh::Point operator()(const libMesh::Point & point) const;

  /**
   * Set how much this coordinate system origin is translated from the canonical/reference
   * coordinate system origin. The translation vector itself should be in reference frame
   * coordinates, e.g. if this API is being used to set the translation of a multi-app based on the
   * multi-app parameter \p positions, then a point from \p positions should be passed to the main
   * application's \p MooseCoordTransform::operator() in order to get the translation in the
   * reference frame
   *
   * In other words, application of \p translation to any point in our domain will give us the
   * corresponding point in the reference frame. Similarly to the \p setRotation with angles API,
   * this represents a forward transformation from our domain to the reference domain
   */
  void setTranslationVector(const libMesh::Point & translation);

  /**
   * A class scope enumeration for conveniently denoting X, Y, and Z axis directions
   */
  enum Direction : unsigned int
  {
    X = 0,
    Y,
    Z,
    INVALID
  };

  /**
   * Set the destination coordinate system and destination radial and symmetry axes as appropriate
   * for RZ or RSPHERICAL simulations. Depending on the coordinate system type of the provided
   * coordinate transform we may perform additional transformations. For instance if the destination
   * coordinate system is RZ and we are XYZ, we will translate our xyz points into RZ points, e.g.
   * we will collapse from three dimensions into two. The transformation would be non-unique if we
   * were to attempt to go from RZ to XYZ, e.g. a single RZ point could correspond to any point in a
   * 2pi rotation around the symmetry axis
   */
  void setDestinationCoordinateSystem(const MooseCoordTransform & destination_coord_transform);

  /**
   * @return our coordinate system
   */
  Moose::CoordinateSystemType coordinateSystem() const { return _coord_type; }

  /**
   * Will setup a rotation transformation. The rotation transformation will be a single 90-degree
   * rotation defined such that a point on the axis specified by \p up_direction is rotated onto the
   * Y-axis, which is our canonical/reference-frame up-direction
   * @param up_direction What direction corresponds to "up" (e.g. the opposite direction of gravity)
   * in our moose mesh
   */
  void setUpDirection(Direction up_direction);

  /**
   * Setup an \emph extrinsic rotation defined in the following way:
   * 1. rotate by \p alpha degrees about the z-axis
   * 2. rotate by \p beta degrees about the x-axis
   * 3. rotate by \p gamma dgrees about the z-axis
   * Definitions of the resulting matrix are found in the last row of the Proper Euler angles column
   * of https://en.wikipedia.org/wiki/Euler_angles#Rotation_matrix. These rotation angles should
   * describe how points in our domain should be rotated in order to arrive back in the reference
   * frame. For instance, in 2D your mesh may appear 90 degrees rotated (around the z-axis) with
   * respect to the reference frame. In such a case, the angle set you should provide to this
   * function is {90, 0, 0}
   *
   * If our coordinate system is RZ, then only certain values of alpha, beta, and gamma will be
   * accepted such that the radial and axial coordinates are rotated onto Cartesian axes and the
   * resulting radial coordinate is non-negative
   */
  void setRotation(Real alpha, Real beta, Real gamma);

  /**
   * Set the scaling transformation
   * @param length_unit How much distance one mesh length unit represents, e.g. 1 cm, 1 nm, 1 ft, 5
   * inches. We will save off the value provided to this in the \p _length_unit data member as well
   * as set the scaling transform
   */
  void setLengthUnit(const MooseUnits & length_unit);

  /**
   * @return How much distance one mesh length unit represents, e.g. 1 cm, 1 nm, 1 ft, 5
   * inches
   */
  const MooseUnits & lengthUnit() const { return _length_unit; }

  /**
   * Set our coordinate system
   * @param system_type the coordinate system type
   * @param rz_symmetry_axis the axial coordinate, e.g. the axis of symmetry
   */
  void setCoordinateSystem(Moose::CoordinateSystemType system_type,
                           Direction rz_symmetry_axis = INVALID);

private:
  /**
   * If the coordinate system type is RZ, then we return the provided argument. Otherwise we return
   * INVALID
   */
  Direction processZAxis(Direction z_axis);

  /// Represents a forward scaling transformation from our units to reference frame units of meters. This
  /// matrix will be diagonal
  std::unique_ptr<libMesh::RealTensorValue> _scale;

  /// Represents a forward rotation transformation from our domain to the reference frame domain
  std::unique_ptr<libMesh::RealTensorValue> _rotate;

  /// Describes a forward translation transformation from our domain to the reference frame domain
  libMesh::Point _translation;

  /// Our coordinate system
  Moose::CoordinateSystemType _coord_type = Moose::COORD_XYZ;
  /// If we are RZ or RSPHERICAL, the Cartesian axis corresponding to the radial coordinate
  Direction _r_axis = INVALID;
  /// If we are RZ, the Cartesian axis corresponding to the axial/axis-of-symmetry coordinate
  Direction _z_axis = INVALID;

  /// The destination coordinate system
  Moose::CoordinateSystemType _destination_coord_type = Moose::COORD_XYZ;
  /// If the destination coordinate system is RZ or RSPHERICAL, the Cartesian axis corresponding to
  /// the radial coordinate
  Direction _destination_r_axis = INVALID;
  /// If the destination coordinate system is RZ, the Cartesian axis corresponding to the
  /// axial/axis-of-symmetry coordinate
  Direction _destination_z_axis = INVALID;

  /// Whether we have different coordinate systems within our single domain. If we do, this will be
  /// problematic if we need to collapse from our space into an RZ or RSPHERICAL space because we
  /// are only ever provided with a point argument and not a subdomain ID argument. Consequently we
  /// will not know in what coordinate system our point lies and will not know how to perform the
  /// dimension collapse, and so we will error
  bool _has_different_coord_sys = false;

  /// How much distance one mesh length unit represents, e.g. 1 cm, 1 nm, 1 ft, 5 inches
  MooseUnits _length_unit = std::string("1m");
};
