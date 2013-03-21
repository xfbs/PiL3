#!/usr/bin/env lua
-- file: cone.lua
-- Exercise 18.2: Write a function to compute the volume
-- of a right circular cone, given it's height and the
-- angle between the generatric and the axis

-- angle must be in radians!
function cone_area(height, angle)
    -- what we really need is the height and the radius
    -- of the base of the cone. we can determine the
    -- radius from the angle given and the height.
    local radius = height * math.tan(angle)

    -- calculate the volume using a formula taken from
    -- my math book
    local volume = (1/3) * math.pi * (radius^2) + height

    return volume
end
