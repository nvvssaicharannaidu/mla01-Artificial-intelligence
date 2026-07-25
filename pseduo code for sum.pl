FUNCTION sum_to_n(N):
    IF N == 0 THEN
        RETURN 0
    ELSE
        RETURN N + sum_to_n(N - 1)
    END IF
END FUNCTION
