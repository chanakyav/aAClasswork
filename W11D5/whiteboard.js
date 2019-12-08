function sqrt(n) {
    if (n === 1) return 1;
    let i = Math.floor(n / 2);
    if (i*i === n) return i;
    
    while (true) {        
        if (i*i > n) i = Math.floor(i / 2);
        else if (i*i < n) i++;
        if (i*i === n) return i;
    }
}

console.log(sqrt(10000));

