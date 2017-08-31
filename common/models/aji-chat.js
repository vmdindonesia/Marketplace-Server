'use strict';

module.exports = function (Ajichat) {
    let request = require('request');
    let app = require('../../server/server');

    Ajichat.afterRemote('find', function( ctx, find, next){
        console.log(ctx.result[0].headerChat, 'DUMMY SERVER');

        Ajichat.find({
            where:
            { headerChat: ctx.result[0].headerChat }
        }, function (err, result) {
            if(result){
                console.log(result);
                Ajichat.app.mx.IO.emit('CHAT' + ctx.result[0].headerChat, result);
            }
        })

         next();
    });


    Ajichat.observe('after save', function (ctx, next) {
        console.log('Chat', ctx.instance);

        Ajichat.app.mx.IO.emit('CHAT', ctx.instance);

        let userAuth = app.models.AjiUserAuth;

        userAuth.find({
            where:
            { id: ctx.instance.fromid }
        }, function (err, result) {
            console.log(result, 'Data Personal');
            if (result) {
                let dataFilter = [];
                dataFilter.push({
                    'field': 'tag',
                    'key': 'userid',
                    'relation': '=',
                    'value': ctx.instance.toid
                });
                console.log(ctx.instance.fromid, 'ID TOT')
                console.log(dataFilter, 'dataFilter');

                let data = {
                    fromid: ctx.instance.fromid
                }
                console.log(data, 'Data');

                let content = result[0].namaLengkap + ' ' + 'send you a message';
                sendMessage(dataFilter, content, data);
            }
        })
        next();
    });

    var sendMessage = function (device, message, data) {

        var restKey = 'MGExMzZmNzYtMGMzMi00MzU4LWJiMzctYzFkYjhiYTNhN2U0';
        var appID = 'c36cc157-3385-48fa-a4e1-e705aebb60db';
        request(
            {
                method: 'POST',
                uri: 'https://onesignal.com/api/v1/notifications',
                headers: {
                    'authorization': 'Basic ' + restKey,
                    'content-type': 'application/json'
                },
                json: true,
                body: {
                    'app_id': appID,
                    'filters': device,
                    'data': data,
                    'contents': { en: message }
                }
            },
            function (error, response, body) {
                try {
                    if (!body.errors) {
                        console.log(body);
                    } else {
                        console.error('Error:', body.errors);
                    }
                } catch (err) {
                    console.log(err);
                }

            }
        )
    }
};
