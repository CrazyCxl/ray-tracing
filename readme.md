# Ray tracing
<div align=center>
<img src="https://raw.githubusercontent.com/CrazyCxl/ray-tracing/master/resource/images/xyzdpc.png"/>
</div>
设
$$
\overrightarrow{OP}=t \overrightarrow{OD}\\\\
$$
$\because$
$$
(t \overrightarrow{OD}-\overrightarrow{OC})^2=r^2
$$
$\therefore$
$$
t^2|\overrightarrow{OD}|^2-2t\overrightarrow{OD}\cdot\overrightarrow{OC}+
|\overrightarrow{OC}|^2-r^2=0
$$
设
$$
\begin{align}
k_1&=|\overrightarrow{OD}|^2\\
k_2&=-2\overrightarrow{OD}\cdot\overrightarrow{OC}\\
k_3&=|\overrightarrow{OC}|^2-r^2
\end{align}
$$
有
$$
{ t_1, t_2 } = {{-k_2 \pm \sqrt{ {k_2}^2 -4k_1k_3} \over {2k_1}}}
$$
其中：

${k_2}^2 -4k_1k_3 > 0$ 时有两个解

${k_2}^2 -4k_1k_3 = 0$ 时有一个解

${k_2}^2 -4k_1k_3 < 0$ 时没有解

当有两个解且都大于1时，设
$$
t = min(t_1,t_2)
$$
$\therefore$
$$
\overrightarrow P=t\overrightarrow{OD}+\overrightarrow O
$$