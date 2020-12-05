digraph MergedGraph {

    // separation space among boxes:
    ranksep=0.1;

    // orthogonal connections:
    splines=ortho

    // adjust box shape here:
    node[shape=box3d width=1.8 height=0.6 fontname="Arial"];

    // the nodes to draw
    ROOT [ label = "Transport" ];
    Ground [ label = "Ground"];

    Road [ label = "Paved roads"];


    define(`digraph',`subgraph')
    include(`Cars.gv')
    include(`Motorcycles.gv')
    include(`Trucks.gv')

    node[shape=none, width=0, height=0, label=""];
    edge[dir=none];

    ROOT -> Ground;
    Ground -> n0;

    {rank=same;  n0 -> Road;}

    Road -> r0;

    r0 -> Cars;
    r0 -> Motorcycles;
    r0 -> Trucks;
}