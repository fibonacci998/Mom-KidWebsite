window.hrfwidget = {
    appId: '363772567412181',
    pageId: '1922106481180673',
    widgets: [{"id":"101002","type":"customer_chat","ref":"__hrf_w_101002"}],
    checkboxs:[],
    customer_chats:[{"_id":9057,"growthtool_id":101002,"logged_in_greeting":null,"logged_out_greeting":null,"greeting_dialog_display":"hide"}]
};

(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = '//harafunnel.com/widget.js?' + (Math.round(+new Date / 1000 * 600));
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'hrfwidget-core'));

function confirmOptIn(id) {
        var w = hrfwidget.widgets.filter(a => a.id == id)

        if (w && w.length > 0) {
            var x = document.getElementById(id);
            var userRef = x.getAttribute('user_ref');
            FB.AppEvents.logEvent('MessengerCheckboxUserConfirmation', null, {
                'app_id': '363772567412181',
                'page_id': '1922106481180673',
                'ref': w[0].ref,
                'user_ref': userRef
            });
        }
    }