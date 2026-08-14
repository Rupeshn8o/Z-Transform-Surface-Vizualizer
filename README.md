A MATLAB-based simulator for visualising transfer functions across the complex z-plane.

It evaluates a given transfer function H(z) over a two-dimensional complex grid and represents its response as a 3D surface. Magnitude is represented geometrically by surface height, while phase is encoded using colour. Instead of examining the transfer function only along the unit circle, this allows the response to be explored across the complex z-plane, with ROC visualisation.

## Visualizations

### 1. Z-Plane Magnitude Surface

The primary visualisation represents:

* X-axis: Re(z)
* Y-axis: Im(z)
* Z-axis: magnitude of H(z)
* Surface colour: phase of H(z)

### 2. Phase Surface

A separate surface is generated using the phase of H(z) as the Z-axis. This visualisation makes phase behaviour easier to inspect independently from magnitude. In particular, phase wrapping and phase discontinuities become visible as sharp changes in the surface.

### 3. Unit Circle Slice

The response along the unit circle is extracted using:

`z = e^(jω)`

This corresponds to the DTFT frequency response for systems where the corresponding transform conditions are satisfied.

The unit circle slice is displayed separately with magnitude and phase.

## Features

* 3D magnitude visualisation over the complex z-plane
* Phase encoded directly into surface colour
* Independent phase surface visualisation
* Phase discontinuity visualisation
* Unit circle response slice
* ROC boundary visualisation
* Constant-radius response slice
* DTFT response extracted along the unit circle
* Magnitude and phase overlay for the unit circle response

Currently implemented as a MATLAB visualisation script.

The project is intended primarily as an educational and exploratory tool for studying transfer functions, complex frequency response, Z-transform behaviour, and the relationship between the Z-transform and DTFT representations.
