DATABASE planets:
    (Mercury, Distance: 57.9, Moons: 0, Type: Terrestrial)
    (Earth, Distance: 149.6, Moons: 1, Type: Terrestrial)
    (Jupiter, Distance: 778.6, Moons: 79, Type: Gas Giant)

FUNCTION find_planets_with_moons_greater_than(min_moons):
    FOR EACH planet IN planets:
        IF planet.Moons > min_moons THEN
            PRINT planet.Name
        END IF
    END FOR
END FUNCTION
