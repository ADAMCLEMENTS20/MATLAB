clear; close; clc;
n = 300;
a=n;
primefacs = [];
divisible = true;
while (divisible)
    
    p = primes(a);
    for i=1:length(p)
        if (mod(a,p(i)) == 0)
            a = a/p(i);
            primefacs = [primefacs p(i)];
            break;
        end
    end
    if (isprime(a))
        primefacs = [primefacs a];
        divisible = false;
    end
end
counts = histcounts(primefacs);
factors = prod(counts + 1)