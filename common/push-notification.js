'use strict';

module.exports = {
    send: send,
    Ajiposting: Ajiposting,

};

function send(data) {
    var headers = {
        "Content-Type": "application/json; charset=utf-8",
        "Authorization": "Basic MGExMzZmNzYtMGMzMi00MzU4LWJiMzctYzFkYjhiYTNhN2U0"
    };

    var options = {
        host: "onesignal.com",
        port: 443,
        path: "/api/v1/notifications",
        method: "POST",
        headers: headers
    };

    var https = require('https');
    var req = https.request(options, function (res) {
        res.on('data', function (data) {
            console.log("Response:");
            console.log(JSON.parse(data));
        });
    });

    req.on('error', function (e) {
        console.log("ERROR:");
        console.log(e);
    });

    req.write(JSON.stringify(data));
    req.end();
}

function Ajiposting(recipientUserId, data) {

    var message = {
        app_id: 'c36cc157-3385-48fa-a4e1-e705aebb60db',
        contents: { en: 'Some the other seller has been promoted their products!', id: 'Seorang Pedagang telah menjual produknya!' },
        filters: [
            { field: 'tag', key: 'userId', relation: '=', value: recipientUserId }
        ],
        data: {
            tag: 'Ajiposting',
            params: data
        }
    };
    send(message);

}