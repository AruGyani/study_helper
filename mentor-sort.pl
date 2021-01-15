% Mentor Help: Sarat Chandra Varanasi
% If you're failing then you need to complete coursework.
neededTasks(X,Y) :- coursework(X,Y,_), grade_urgency(X,36).	

% Find the max element at an index in a list of sublists
max_by_index([H|T], Index, Max) :-        
           element_at_index(H, Index, M),
           max_by_index(T, Index, M, Max).

max_by_index([], _, Max, Max).

max_by_index([H|T], Index, M, Max) :-
         element_at_index(H, Index, M1),
         M > M1, 
         max_by_index(T, Index, M, Max).

max_by_index([H|T], Index, M, Max) :-
         element_at_index(H, Index, M1),
         M =< M1, 
         max_by_index(T, Index, M1, Max).

% Find the sublist corresponding to the max element at an index in a list of 
% sublists
max_sublist_by_index([H|T], Index, Sublist) :-        
           element_at_index(H, Index, M),
           max_sublist_by_index(T, Index, M, H, Sublist).

max_sublist_by_index([], _, _, Sublist, Sublist).

max_sublist_by_index([H|T], Index, M, Sublist, Sublist1) :-
         element_at_index(H, Index, M1),
         M > M1, 
         max_sublist_by_index(T, Index, M, Sublist, Sublist1).

max_sublist_by_index([H|T], Index, M, Sublist, Sublist1) :-
         element_at_index(H, Index, M1),
         M =< M1, 
         max_sublist_by_index(T, Index, M1, H, Sublist1).

% get element at in index in a list
element_at_index([H|T], 0, H).
element_at_index([H|T], Index, E) :-
            Index > 0,
            Index1 is Index - 1,
            element_at_index(T, Index1, E).

% remove first occurence of an element in a list
remove_element(X, [X|T], T).
remove_element(X, [Y|T], [Y|T1]) :-
            X \= Y, 
            remove_element(X, T, T1).

% sort elements by indices in a list of sublists
% Assumption: sorted only upon a numeric value
sort_by_index([H|T], Index, [Max|Sorted]) :-
      max_sublist_by_index([H|T], Index, Max),
      remove_element(Max, [H|T], T1),
      sort_by_index(T1, Index, Sorted).

sort_by_index([], _, []).
