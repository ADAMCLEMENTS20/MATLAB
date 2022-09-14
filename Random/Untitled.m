clear;close;clc;
words = ["saute" "mirin" "anise" "apple" "aspic" "bacon" "bagel" "basil" "beans" "berry" "bland" "bread" "broil" "candy" "cater" "chard" "chili" "chips" "cream" "crepe" "crisp" "crumb" "crust" "curds" "curry" "dairy" "dates" "diner" "dough" "dried" "drink" "feast" "flour" "fried" "fruit" "grain" "grape" "gravy" "guava" "herbs" "honey" "icing" "jelly" "juice" "kebab" "knife" "ladle" "lemon" "liver" "lunch" "maize" "mango" "melon" "mints" "mochi" "munch" "olive" "onion" "order" "pasta" "patty" "peach" "pecan" "pilaf" "pizza" "plate" "prune" "punch" "roast" "salad" "salsa" "sauce" "seeds" "slice" "snack" "spicy" "spoon" "spork" "spuds" "squid" "steak" "stove" "straw" "sugar" "sushi" "sweet" "syrup" "thyme" "toast" "torte" "tuber" "wafer" "water" "wheat" "yeast"];
scores = zeros(1,length(words));
greens = zeros(1,length(words));
yellows = zeros(1,length(words));
places = [length(words):-1:1];
for i=1:length(words)
    for j=1:length(words)
        guess = words(i);
        answer = words(j);
        %fprintf("Word Guessed: %s\nActual Word: %s\n",guess,answer)
        guesschars = char(guess);
        answerchars = char(answer);
        [let,ig,ia] = intersect(guesschars,answerchars);
        for k=1:length(ig)
            if ig(k) == ia(k)
                scores(i) = scores(i) + 3;
                greens(i) = greens(i) + (1/length(words));
            else
                scores(i) = scores(i) + 1;
                yellows(i) = yellows(i) + (1/length(words));
            end
        end
    end
end
result = [transpose(words) transpose(scores) transpose(greens) transpose(yellows)];
sortedresults = [transpose(places) sortrows(result,2)];
xlswrite('FoodleBestWords.xlsx',sortedresults)
fprintf("Done")