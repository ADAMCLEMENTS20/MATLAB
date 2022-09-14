clear; close; clc;
%Author: Adam Clements
%Summary: Make a graphical interface to suggest music or movies
%--------------------------------------------------------------------------
%run function
suggest;
%function that takes in a number, then runs 1 of 2 functions, or shows an
%error message and quits
function suggest
    rec = input("input a 1 for music recommendations or a 2 for movie recommendations");
    switch rec
        case 1
            musRec;
        case 2
            movRec;
        otherwise
            fprintf("Invalid Input")
    end
end
%function to ask for genre and recommend (music)
function  musRec
    rec = input("input a 1, 2, or 3 for the following reccomendations\n1: Rock\n2: Pop/Hip Hop\n3: Rap\n");
    fprintf("Adam's Music Suggestions\n")
    switch rec
        case 1
            fprintf("1. Don't Stop Believin'\n2. Go Your Own Way\n3. Follow You Down")
        case 2
            % Rick Roll Dr. Dostert (To be clear these are not actually my
            % recommendations. I just needed to prank you when I had the
            % opportunity)
            fprintf("1. Never Gonna Give You Up\n2. Let You Down\n3. Desert You\n")
            %"####(((((((///(%%%%%%#%%%%#%%%%%%%%%%%%%%#%%%%%%%%%%%%%#,,.,,...................
            %"###(((((((///(#%%%%%#%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(,.....................
            %"###(((((((///(#%%%%%######%%%%%%%%%%#########%%%%%#%%%%%%%/.....................
            %"###((((((////#%%%%##(/(/***///#//**,...,,,***/(##%#%%%%%%#/.....................
            %"###((((((////(####/,,...      ...    ...,,***/(##%%#%%%%%#,.....................
            %"##(((((((/////#%#(*........  . .  .....,,,***//###%%%%%%##.....  .    ..........
            %"##((((((((///*###(,,,......  ..    ....,,****//(##%%%%%%#,...  . ..    .    ....
            %"(((((((((/////*##(*,,............ .....,,****//(##%%%%%#(....      .            
            %"((((((((////****(#***//////*,,....,,/((##((/(##%%%%%%%%%(/... .  .           .  
            %"(((((((//////****(*****/(#((*,,...*/**,.(#(((///(##%%%%%#(..                 ...
            %"(((((///////*******,,.,,,,.......,**,.....,,,,,,*/#%%%%##(.                  .. 
            %"(((((////////***,.*,.........,,..,***,.....,,,,*((%%%%%#(. .                    
            %"(((//////////****,,*,........,,.,*///,,....,,*/(#%%%%%##..   .                ..
            %"((//////////******,.*,,.....,,,.,*///(,...,,*/((#%%%#/.....                    .
            %"((////////////****,,,*,.......,,*,,,.,,.,,,,*//(#%%%#,.....                  . .
            %"(/////////////******,**,,...........,,,,,,,**/(##%%%%(,... .                   .
            %"/////////////******,*,*,,.,,*/(//((///*,.,**((##%%%%%%%%##....                  
            %"//////////********,,***,,,,..,**///(**,,,*//(##%%%##( .#%##(...                 
            %"////////*****************,*,.....  ...,**/(######/* .,#%%%%##(.                 
            %"/**************************,***,,,,**//(((####(,,  .,#%%%%%%%%#*                
            %"**************************** ,,,*##########(,.     (#%%%%%%%%%%%%###.           
            %"*****,,,******************,, /,,,,........        ##%%%%%%%%%%%%%%%%%%##*.. .  .
            %"****,,,,,******************* ./..,.,..          .##%%%%%%%%%%%%%%%%%%%%%%%##*...
            %"******,*,,*,*************###(    .             (##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
        case 3
            %Yes I am a fan of Eminem... Could you tell?
            fprintf("1. Lose Yourself\n2. Mockingbird\n3. Godzilla")
        otherwise
            fprintf("Invalid Input")
    end
end
%function to ask for genre and recommend (movies)
function  movRec
    rec = input("input a 1, 2, or 3 for the following reccomendations\n1: Comedy\n2: Horror\n3: Action/Adventure\n");
    fprintf("Adam's Movie Suggestions\n")
    switch rec
        case 1
            fprintf("1. Ferris Bueller's Day off\n2. Deadpool\n3. Spaceballs")
        case 2
            fprintf("1. Saw\n2. Halloween \n3. IT")
        case 3
            %yes these are all series of movies, but I can't recommend
            %just 1)
            fprintf("1. Star Wars\n2. Avengers\n3. Indiana Jones")
        otherwise
            fprintf("Invalid Input")
    end
end