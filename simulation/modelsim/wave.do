view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 3000ps sim:/processador/clock 
wave create -driver freeze -pattern clock -initialvalue 0 -period 2500ps -dutycycle 50 -starttime 0ps -endtime 3000ps sim:/processador/reset 
WaveCollapseAll -1
wave clipboard restore
