function shortDist(str, char) {
    let charIdx = [];
    for (let i = 0; i < str.length; i++) if (str[i] === char) charIdx.push(i);
    let results = [];
    for (let i = 0; i < str.length; i++) {
        if (str[i] === char) results.push(0);
        else {  
            charIdx.forEach( el => temp.push(Math.abs(el - i)) );
            results.push(Math.min(...temp));
            temp = [];
        }
    }
    return results;
}

console.log(shortDist("loveleetcode", "e"));

function combos(k, n) {
    
}
