/* ----------------------------- Global Definitions -------------------- */ 

body { 
margin: 0px; 
padding: 0px; 

color: #222; 
background-color: #fff; 
font-size: 11px; 
quotes: "\201C" "\201E" "\2018" "\2019"; 
} 

@media screen { 
body { 
background-image: url(../images/stata.jpg); 
background-position: left bottom; 
background-repeat: no-repeat; 
} 
} 

a:link { 
color: #222; 
} 

a:visited { 
color: #666; 
} 

a:hover { 
color: #000; 
} 

a:active { 
} 

a:focus { 
} 

img { 
border: none; 
} 

/* ----------------------------- Sidebar -------------------------- */ 

#sidebar { 
float: right; 
top: 150px; 
right: 0px; 
width: 220px; 
background-color: white; 
padding: 0px 0px 0px 0px; 
margin: 0px 0px 4em 4em; 
border-left: 1px solid #ccc; 
border-bottom: 1px solid #ccc; 
} 

#sidebar .logo { 
text-align: center; 
padding: 2em 0px 1em 0px; 
margin: 0px; 
} 

#sidebar h1 { 
font-family: "verdana", "helvetica", "arial", sans-serif; 
letter-spacing: 0.15em; 
font-size: 24px; 
color: #333; 
font-weight: normal; 
text-align: center; 
padding: 5px; 
} 

#sidebar h2 { 
font-family: "verdana", "helvetica", "arial", sans-serif; 
letter-spacing: 0.15em; 
text-transform: uppercase; 
font-size: 11px; 
color: #666; 
font-weight: normal; 
padding: 2px 0px 2px 4px; 
margin: 5px 0px 5px 10px; 
border-top: 1px solid #ccc; 
border-left: 1px solid #ccc; 
border-bottom: 1px solid #ccc; 
border-color: #ccc; 
color: #666; 
} 

#sidebar p { 
font-family: "verdana", "helvetica", "arial", sans-serif; 
font-size: 10px; 
padding-left: 20px; 
padding-right: 5px; 
} 

#sidebar ul { 
margin: 5px 5px 15px 5px; 
padding-left: 25px; 
} 

#sidebar li { 
margin-left: 0px; 
font-family: "verdana", "helvetica", "arial", sans-serif; 
font-size: 10px; 
} 

#sidebar .important li { 
font-weight: bold; 
} 

#sidebar .verbose li { 
padding: 1px 0px 1px 0px; 
} 

#sidebar li.current { 
font-weight: bold; 
} 

#sidebar .news { 
font-family: "verdana", "helvetica", "arial", sans-serif; 
font-size: 90%; 
border-top: 1px solid #ccc; 
text-align: center; 
padding: 1em; 
} 

#sidebar .prominent { 
font-family: "verdana", "helvetica", "arial", sans-serif; 
text-align: center; 
padding: 1em; 
padding-top: 0px; 
} 

/* ----------------------------- Path ---------------------------- */ 

#path { 
color: #333; 
background-color: #f8f8f8; 
border-bottom: 1px solid #ccc; 
padding: 2px 8px 2px 4px; 
margin: 0px; 
} 

#path li { 
display: inline; 
padding-left: 13px; 
padding-right: 3px; 
background-image: url(../images/arrow.gif); 
background-repeat: no-repeat; 
background-position: 1px 5px; 
} 

#path span { 
font-weight: bold; 
} 

/* ----------------------------- Body ---------------------------- */ 

#body { 
padding: 10px 10px 10px 10px; 
margin: 0px 20px 10px 20px; 
} 

#body h1,h2,h3,h4 { 
color: #666; 
} 

#body h1 { 
border-top: 1px solid #ccc; 
background-color: #eee; 
border-bottom: 1px solid #ccc; 
padding: 3px 8px 3px 12px; 
margin: 15px -30px 35px -30px; 
} 

#body h2 { 
border-bottom: 1px solid #ccc; 
margin: 30px 0px 0px 0px; 
padding: 0px; 
} 

#body .steps li { 
padding: 5px; 
} 

#body .note { 
margin: 3px; 
padding: 3px; 
border: 1px solid #ccc; 
background-color: #eee; 
} 

#body .note:before { 
content: "Note: "; 
font-weight: bold; 
} 

#body .figure { 
text-align: center; 
} 

#body .figure img { 
border: 1px solid #ccc; 
} 

#body pre { 
margin: 20px; 
padding: 10px; 
border: 1px solid #ccc; 
background-color: #eee; 
} 

#body .screenshot { 
text-align: center; 
} 

#body .notice { 
margin: 15px; 
padding: 5px; 
background-color: #eee; 
border: 1px solid #ccc; 
} 

#body .notice:before { 
content: "Notice: "; 
font-weight: bold; 
} 

#body dl dt { 
font-weight: bold; 
padding: 5px; 
} 

#body p.important { 
margin: 40px 0px 40px 0px; 
text-align: center; 
font-size: 130%; 
font-weight: bold; 
} 

#body #slideshow { 
border: 1px solid #ccc; 
background-image: url(../images/body_back.gif); 
background-position: top left; 
background-repeat: repeat-x; 
margin-left: 30px; 
margin-right: 250px; 
height: 14em; 
} 

#body #slideshow .item { 
display: none; 
margin: 10px; 
} 

#body #slideshow .item .icon { 
margin: 10px; 
float: right; 
} 

#body #slideshow .item .title { 
margin: 10px; 
padding: 2px;
font-size: 300%;
font-weight: bold; 
font-family: "verdana", "helvetica", "arial", sans-serif; 
} 

#body #slideshow .item .description { 
margin: 10px; 
font-size: 130%; 
height: 8em; 
} 

#body #slideshow .item .logo img { 
border: 1px solid #ccc; 
} 


/* ----------------------------- Footer ---------------------------- */ 

#footer { 
margin: 0px 0px 5em 0px; 
padding: 2px 5px 2px 10px; 
border-top: 1px solid #aaa; 
border-bottom: 1px solid #aaa; 
border-right: 1px solid #aaa; 
font-family: "verdana", "helvetica", "arial", sans-serif; 
letter-spacing: 0.15em; 
text-transform: uppercase; 
font-size: 10px; 
text-align: right; 
float: left; 
background: white; 
} 

#footer img { 
margin: 5px 10px 5px 10px; 
} 

body { 
margin-bottom: 20em; 
} 

table { 
font-size: 100%; 
} 

.timeline-default { 
font-family: Trebuchet MS, Helvetica, Arial, sans serif; 
font-size: 8pt; 
border: 1px solid #aaa; 
} 
</style> 
<style type="text/css"> 
.timeline-ether-marker-bottom { 
width: 5em; 
height: 1.5em; 
border-left: 1px solid #aaa; 
padding-left: 2px; 
color: #aaa; 
} 

.timeline-ether-marker-bottom-emphasized { 
width: 5em; 
height: 2em; 
border-left: 1px solid #aaa; 
padding-left: 2px; 
color: black; 
} 

.timeline-ether-marker-top { 
width: 5em; 
height: 1.5em; 
border-left: 1px solid #aaa; 
padding-left: 2px; 
color: #aaa; 
} 

.timeline-ether-marker-top-emphasized { 
width: 5em; 
height: 2em; 
border-left: 1px solid #aaa; 
padding-left: 2px; 
color: black; 
} 


.timeline-ether-marker-right { 
width: 5em; 
height: 1.5em; 
border-top: 1px solid #aaa; 
padding-top: 2px; 
color: #aaa; 
} 

.timeline-ether-marker-right-emphasized { 
width: 7em; 
height: 1.5em; 
border-top: 1px solid #aaa; 
padding-top: 2px; 
color: black; 
} 
.timeline-ether-marker-left { 
width: 5em; 
height: 1.5em; 
border-top: 1px solid #aaa; 
padding-top: 2px; 
color: #aaa; 
} 

.timeline-ether-marker-left-emphasized { 
width: 7em; 
height: 1.5em; 
border-top: 1px solid #aaa; 
padding-top: 2px; 
color: black; 
} 
.timeline-duration-event { 
position: absolute; 
overflow: hidden; 
border: 1px solid blue; 
} 

.timeline-instant-event2 { 
position: absolute; 
overflow: hidden; 
border-left: 1px solid blue; 
padding-left: 2px; 
} 

.timeline-instant-event { 
position: absolute; 
overflow: hidden; 
} 

.timeline-event-bubble-title { 
font-weight: bold; 
border-bottom: 1px solid #888; 
margin-bottom: 0.5em; 
} 

.timeline-event-bubble-body { 
} 

.timeline-event-bubble-wiki { 
margin: 0.5em; 
text-align: right; 
color: #A0A040; 
} 
.timeline-event-bubble-wiki a { 
color: #A0A040; 
} 

.timeline-event-bubble-time { 
color: #aaa; 
} 

.timeline-event-bubble-image { 
float: right; 
padding-left: 5px; 
padding-bottom: 5px; 
}.timeline-container { 
position: relative; 
overflow: hidden; 
} 

.timeline-copyright { 
position: absolute; 
bottom: 0px; 
left: 0px; 
z-index: 1000; 
cursor: pointer; 
} 

.timeline-message-container { 
position: absolute; 
top: 30%; 
left: 35%; 
right: 35%; 
z-index: 1000; 
display: none; 
} 
.timeline-message { 
font-size: 120%; 
font-weight: bold; 
text-align: center; 
} 
.timeline-message img { 
vertical-align: middle; 
} 

.timeline-band { 
position: absolute; 
background: #eee; 
z-index: 10; 
} 

.timeline-band-inner { 
position: relative; 
width: 100%; 
height: 100%; 
} 

.timeline-band-input { 
position: absolute; 
width: 1em; 
height: 1em; 
overflow: hidden; 
z-index: 0; 
} 
.timeline-band-input input{ 
width: 0; 
} 

.timeline-band-layer { 
position: absolute; 
width: 100%; 
height: 100%; 
} 

.timeline-band-layer-inner { 
position: relative; 
width: 100%; 
height: 100%; 
} 
