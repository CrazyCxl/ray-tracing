.import "cxlmath.js" as CxlMath;

/**
  功能:光线追踪
  参数:
    origin:出发点
    direct_p:经过的点
    spheres:物体数组
  返回值:
    对应color或null
**/
var traceRay = function(origin,direct_p,spheres) {
    var t_save = Infinity
    var sphere_save = null

    for(var i = 0;i < spheres.length;i++){
        var intersect_p = intersectRaySphere(origin,direct_p,spheres[i])
        if(intersect_p !== null && t_save > intersect_p[1]){
            t_save = intersect_p[1]
            sphere_save = spheres[i]
        }
    }

    if(sphere_save !== null){
        return sphere_save.color
    }

    return null
}

/**
  功能:检测是否交叉
  参数:
    origin:出发点
    direct_p:经过的点
    sphere:物体
  返回值:
    对应交叉点或null
**/
var intersectRaySphere = function(origin,direct_p,sphere){
    var origin_direct_p = CxlMath.subtract(origin,direct_p)
    var origin_sphere_center = CxlMath.subtract(origin,sphere.center)

    var k1 = CxlMath.dotProduct(origin_direct_p,origin_direct_p)
    var k2 = -2*CxlMath.dotProduct(origin_direct_p,origin_sphere_center)
    var k3 = CxlMath.dotProduct(origin_sphere_center,origin_sphere_center) - sphere.radius*sphere.radius

    var discriminant = k2*k2 - 4*k1*k3;
    if(discriminant > 0){
        var t1 = (-k2 + Math.sqrt(discriminant))/2*k1
        var t2 = (-k2 - Math.sqrt(discriminant))/2*k1
        var t = t1>t2?t2:t1
        if(t > 1){
            var intersect_p = CxlMath.additoin(origin,CxlMath.multiplication(origin_direct_p,t))
            return [intersect_p,t]
        }
    }
    return null
}
