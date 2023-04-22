-module(minPos).
-author("nikit").

%% API
-compile(export_all).

min_positive_number([]) -> error;

min_positive_number([H|T]) -> 
    case is_integer(H) and (H >= 1) of
        false -> min_positive_number(T);
        true -> min_positive_number(T, H)
    end.

min_positive_number([], Min) -> Min;

min_positive_number([H|T], Min) ->

    case is_integer(H) and (H >= 1) of
        false -> min_positive_number(T, Min);
        true -> 
        case (H < Min) of
            true -> min_positive_number(T, H);
            false -> min_positive_number(T, Min)
        end
    end.

ex() -> min_positive_number([3,a,false,-3,1]).