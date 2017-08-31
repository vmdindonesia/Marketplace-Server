'use strict';

module.exports = function (Ajitopup) {
    let request = require('request');
    let app = require('../../server/server');

    Ajitopup.observe('after save', function (ctx, next) {
        console.log('Re - Top Up', ctx.instance);
        if (ctx.instance) {
            let dataFilter = [];
            dataFilter.push({
                'field': 'tag',
                'key': 'userid',
                'relation': '=',
                'value': '8'
            });

            let data = {
                fromid: ctx.instance.idCustomer
            }

            let content = ctx.instance.namaCustomer + ' ' + 'have been top up';
            sendMessage(dataFilter, content, data);
        }
        next();
    });

    Ajitopup.afterRemote('updateAll', function (ctx, modelInstance, next) {
        console.log('Approved', ctx.args.where);
        // let Ajiuser = app.models.Ajiuserauth;

        Ajitopup.find({
            where:
            { id: ctx.args.where.id }
        }, function (err, results) {
            console.log(results, 'DAT')
            console.log(results[0].idCustomer, 'CUY')

            if (results) {
                let dataFilter = [];
                dataFilter.push({
                    'field': 'tag',
                    'key': 'userid',
                    'relation': '=',
                    'value': results[0].idCustomer
                });

                let data = {
                    fromid: '8'
                }

                let content = 'Hai, ' + results[0].idCustomer + ' ' + 'Your Top have been confirm';
                sendMessage(dataFilter, content, data);
            }
        });

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
