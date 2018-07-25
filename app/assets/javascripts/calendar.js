// $(document).on('turbolinks:load', function() {
//     $('.calendar').fullCalendar({
//         defaultView: 'month',
//         header:
//         {
//             left: 'prev,next today',
//             center: 'title',
//             right: ''
//         }

//     });
// })




$(document).on('turbolinks:load', function() {
    $('.calendar').fullCalendar({
        themeSystem: 'bootstrap4',
        selectable: true,
        selectHelper: true,
        editable: true,
        header:
        {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listYear'
        },
        googleCalendarApiKey: 'AIzaSyC3g2pUoq-inHV1mCW0LMqqVhyXjlL6QIM',
        events: {
            googleCalendarId: '7jiqsugob1t0kua9snlulia80g@group.calendar.google.com'
        }
    });

});

