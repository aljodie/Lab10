% -------------------------
% Task 1: Area and perimeter
% -------------------------


% Square
square(Side, Area, Perimeter) :-
    Area is Side * Side,
    Perimeter is 4 * Side.

% Rectangle
rectangle(Width, Height, Area, Perimeter) :-
    Area is Width * Height,
    Perimeter is 2 * (Width + Height).

% Triangle
triangle(Base, Height, A, B, C, Area, Perimeter) :-
    Area is 0.5 * Base * Height,
    Perimeter is A + B + C.


% -------------------------
% Task 2: Login system
% -------------------------


% Dataset
credentials(rayian, 1234).
credentials(sara, abcd).
credentials(joud, ddmm2026).

% Start login
login :-
    login_attempt(1).

% Read username and password
login_attempt(Attempt) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    check_login(Username, Password, Attempt).

% Check correct username and password
check_login(Username, Password, _) :-
    credentials(Username, Password),
    write('Login Successful'),
    nl.

% Check incorrect username and password
check_login(Username, Password, Attempt) :-
    \+ credentials(Username, Password),
    write('Login Unsuccessful'),
    nl,
    retry_login(Attempt).

% Allow two more attempts
retry_login(Attempt) :-
    Attempt < 3,
    NextAttempt is Attempt + 1,
    login_attempt(NextAttempt).

% Maximum attempts exceeded
retry_login(Attempt) :-
    Attempt >= 3,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'),
    nl.