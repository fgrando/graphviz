# Graphviz Examples

## Merging two graphs

![Cars](https://raw.githubusercontent.com/fgrando/graphviz/main/Cars.gv.png)
![Motorcycles](https://raw.githubusercontent.com/fgrando/graphviz/main/Motorcycles.gv.png)
![Trucks](https://raw.githubusercontent.com/fgrando/graphviz/main/Trucks.gv.png)



The best way I found so far to merge DOT graphs is with a macro script. I've being using an **M4** script that includes the graph file as a subgraph and it works (details [here](https://stackoverflow.com/questions/53202550/merging-graphs-in-graphviz)). The only limitation is that it gets messy if you have nodes with the same name  in the included graphs.

![Merged](https://raw.githubusercontent.com/fgrando/graphviz/main/Merged.m4.gv.png)

The generate scrips runs all M4 scripts to generate the .gv sources and then the dot command:
``` bat
for /r %%i in (*.m4) do (
	m4 "%%i" > "%%i.gv"
)

for /r %%i in (*.gv) do (
	Graphviz\bin\dot "%%i" -Tpng -o "%%i.png"
)
```

With **gvpack** nodes with same name are automatically renamed, but them the problem is that the merged graph always has unconnected nodes (since they have different names). But they can be renamed by hand, so it is not that bad.

`gvpack.exe -u Cars.gv Motorcycles.gv Trucks.gv MergedGV.gv > gvpack-merged.gv`
![MergedGV](https://raw.githubusercontent.com/fgrando/graphviz/main/MergedGV.gv.png)


### Software sources
[M4 Windows](http://gnuwin32.sourceforge.net/packages/m4.htm)
[Graphviz](https://www2.graphviz.org/Packages/stable/windows/10/msbuild/Release/Win32/)
