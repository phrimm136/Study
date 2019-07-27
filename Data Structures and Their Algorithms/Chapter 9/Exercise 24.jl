#=

Q.

The problem of retrieving sets of cities from a geographical data
base according to minimum and maximum latitude and longitude does
not, in fact, quite fit the model for multidimensional range searching
presented on page 321. While latitudes have natural minimum and
maximum values (90° S and 90° N), longitudes vary in cyclical fash-
ion, from 0° E (= 0° W) to 90° E to 180° E = 180° W to 90° W
back to 0°. Thus we might want to do a range search for the range
from 10° W to 10° E longitude, or from 170° E to 170° W, or, for
that matter, from 10° E to 10° W (that is, most of the way around the
globe). Explain how to do range searching in a domain of this type,
and present pseudocode for your algorithm.

A.

Set longitude from 1° E to 180° E positive, from 0° E to 179° W negative,
and 180° W to 180° E.
So longitude is represented as -179~180.
In searching, if query is x°E <(=) K <(=) y°W, change query that
K >(=) x and K <(=) -y (or x if x=180° W).

=#

function range_longitude(x, y, K)
    if 'E' in x
        x_value = parse(Int, [1:length(x)-3])
    elseif 'W' in x
        if parse(Int, x[1:3]) == 180
            x_value = parse(Int, [1:length(x)-3])
        else
            x_value = -parse(Int, [1:length(x)-3])
        end
    end
    if 'E' in y
        y_value = parse(Int, [1:length(y)-3])
    elseif 'W' in y
        if parse(Int, y[1:3]) == 180
            y_value = parse(Int, [1:length(y)-3])
        else
            y_value = -parse(Int, [1:length(y)-3])
        end
    end
    if 'E' in K
        K_value = parse(Int, [1:length(K)-3])
    elseif 'W' in y
        if parse(Int, K[1:3]) == 180
            K_value = parse(Int, [1:length(K)-3])
        else
            K_value = -parse(Int, [1:length(K)-3])
        end
    end
        
    if x_value > 0 && y_value < 0
        return K_value >= x_value && K_value <= y_value
    else
        return x_value <= K_value <= y_value
    end
end
