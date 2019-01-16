var eventId = 0;	

	$(document).ready(function() {
	    var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		var evts = [];
		
		console.log("asd");
		
		$.ajax({
			url : "/dp/mypage/selectMypage.do",
			success : function(data){
				for(var i=0; i<data.length; i++){
					var evt = {
						id: data[i].mcno,
						title: data[i].mcContent,
						start: data[i].mcStart + 86400000,
						end : data[i].mcEnd + 86400000 + 86400000,
						allDay: true,
						className: 'info',
						editable : (data[i].type == 1) ? true : false,
						color : (data[i].type == 1) ? '#03a9f3' : '#9675ce',
						getMcno : function(){
							return data[i].mcno;
						}
						
					}
					console.log(data[i].mcStart +' ~ ' +data[i].mcEnd);
					console.log(evt.getMcno());
					
					evts.push(evt);
				}
			},
			error : function(data){
				console.log(data);
			},
			async : false
		});
		
		console.log(evts);
		/*  className colors
		
		className: default(transparent), important(red), chill(pink), success(green), info(blue)
		
		*/		
		
		  
		/* initialize the external events
		-----------------------------------------------------------------*/
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		var calendar =  $('#calendar').fullCalendar({
			 header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month,listMonth'
		      },
			editable: true,
			firstDay: 0, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('일정을 입력해주세요');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							id: ++eventId,
							title: title,
							start: start,
							end: end,
							allDay: allDay
							
						},
						true // make the event "stick"
					);
					
					location.href = "/dp/mypage/insert.do?start=" + start + "&end=" + end + "&content=" + title;
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			},
			eventClick: function(event){
	            var id = event.id;
	            var title = event.title;
	            var start = event.start.format('YYYY-MM-DD');
	            var end = event.end;
	            var editable = event.editable;
	            var evtType = (editable == true) ? "내 일정" : "업무";
	            console.log(event);
	            gEvent = event;
	            
	            $("#myCalendarModal").find(".modal-title").text("["+evtType+"]"+start + " " + title);
	            $("#myCalendarModal").find("#editCalendar").val(title);
	            if(!editable){

	            	$("#myCalendarModal").find("#editCalendar").prop('readonly',true);
	            	$('#upbtn').css('display', 'none');
	            	$('#delbtn').css('display', 'none');
	            } else {
	            	$("#myCalendarModal").find("#editCalendar").prop('readonly', false);
	            	$('#upbtn').css('display', 'block');
	            	$('#delbtn').css('display', 'block');
	            	
	            }
	            $("#myCalendarModal").find("#calendarId").val(id);
	            
	            
	            
	            // Show Modal
	            $("#myCalendarModal").modal('show');
			},
			events : evts
		});
		
		
	});
