let g:Powerline#Segments#amadeus#segments = Pl#Segment#Init(['amadeus',
	\ Pl#Segment#Create('current_dir', '%{Powerline#Functions#amadeus#GetCurrentFolder()}'),
	\ Pl#Segment#Create('filename'        , '%f'),
	\ Pl#Segment#Create('fileinfo',
		\ Pl#Segment#Create('flags.ro'    , '%{&readonly ? "$RO" : ""}'),
		\ Pl#Segment#Create('name'        , '%f'),
		\ Pl#Segment#Create('flags.mod'   , '%M'),
		\ Pl#Segment#Create('flags.type'  , '%H%W'),
	\ )
\ ])
