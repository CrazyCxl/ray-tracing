import QtQuick 2.10
import QtQuick.Window 2.10
import "qrc:/js/sphere.js" as SphereJS
import "qrc:/js/traceray.js" as TraceRayJs

Window {
    visible: true
    width: 600
    height: 600
    title: qsTr("Hello World")
    property var origin: [0,0,0]
    Canvas{
        anchors.fill: parent
        id:canvas
        property int deep:1
        onPaint: {
            var ctx = getContext("2d")
            var canvas_buffer = ctx.getImageData(0, 0, canvas.width, canvas.height);
            var canvas_pitch = canvas_buffer.width * 4;

            var spheres = [new SphereJS.Sphere([-1, 1, 3], 1, [255, 0, 0]),
                       new SphereJS.Sphere([2, 0, 4], 1, [0, 0, 255]),
                       new SphereJS.Sphere([-1, -1, 4], 1, [0, 255, 0])];

            for(var Cy = 0;Cy < canvas.height;Cy++){
                for(var Cx = 0 ;Cx < canvas.width;Cx++){
                    //Transformation of coordinate system
                    var Vx = Cx - canvas.width/2
                    var Vy = canvas.height/2 - Cy
                    var V = [Vx,Vy,deep]

                    //zoom to 1 1 1
                    V[0] = V[0]*(1/canvas.width)
                    V[1] = V[1]*(1/canvas.height)

                    //get color
                    var color = TraceRayJs.traceRay(origin,V,spheres)
                    if(color === null){
                        color = [255,255,255]
                    }
                    putPixel(Cx,Cy,color,canvas_pitch,canvas_buffer)
                }
            }
            ctx.drawImage(canvas_buffer, 0, 0);
        }

        function putPixel(x, y, color,canvas_pitch,canvas_buffer) {
          if (x < 0 || x >= canvas.width || y < 0 || y >= canvas.height) {
            return;
          }
          var offset = 4*x + canvas_pitch*y;
          canvas_buffer.data[offset++] = color[0];
          canvas_buffer.data[offset++] = color[1];
          canvas_buffer.data[offset++] = color[2];
          canvas_buffer.data[offset++] = 255; // Alpha = 255 (full opacity)
        }
    }
}
