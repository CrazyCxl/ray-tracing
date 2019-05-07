
//点乘
var dotProduct = function (p1,p2){
    var sum = 0;
    for(var i = 0;i < p1.length ; i++){
        sum += p1[i]*p2[i];
    }
    return sum;
}

//return p2-p1
var subtract = function(p1,p2){
    var v=[];
    for(var i = 0;i < p2.length ; i++){
        v[i] = p2[i] - p1[i];
    }
    return v;
}

//return p2+p1
var additoin = function(p1,p2){
    var v=[];
    for(var i = 0;i < p2.length ; i++){
        v[i] = p2[i] + p1[i];
    }
    return v;
}

//return p1*t
var multiplication = function(p1,t){
    var p=[];
    for(var i = 0;i < p1.length ; i++){
        p[i] = p1[i] * t;
    }
    return p;
}
