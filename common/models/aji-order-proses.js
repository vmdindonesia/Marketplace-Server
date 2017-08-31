'use strict';

module.exports = function (Ajiorderproses) {
    let request = require('request');
    let app = require('../../server/server');

    Ajiorderproses.afterRemote('create', function (ctx, modelInstance, next) {
        console.log('Proses', ctx.result);
        let status = ctx.result.status;
        let userAuth = app.models.AjiUserAuth;

        userAuth.findById(ctx.result.idCustomer, function (err, result) {
            console.log(result, 'Data Personal');

            let data = {
                idCustomer: result.id
            }

            let dataFilter = [];
            dataFilter.push({
                'field': 'tag',
                'key': 'userid',
                'relation': '=',
                'value': result.id
            });
            let content = 'Hai ' + result.namaLengkap + ',' + ' ' + 'Your order have been ' + status;
            sendMessage(dataFilter, content, data);
        });
        next();
    });

    Ajiorderproses.afterRemote('updateAll', function (ctx, modelInstance, next) {
        console.log('Update Id Order', ctx.args.where.idOrder);
        console.log('Update Status Order', ctx.args.data.status);
        let status = ctx.args.data.status;
        let userAuth = app.models.AjiUserAuth;

        Ajiorderproses.findById(ctx.args.where.idOrder, function (err, result) {
            console.log(result, 'Result')

            userAuth.findById(result.idCustomer, function (err, result) {
                console.log(result, 'Data Personal');

                let data = {
                    idCustomer: result.id
                }

                let dataFilter = [];
                dataFilter.push({
                    'field': 'tag',
                    'key': 'userid',
                    'relation': '=',
                    'value': result.id
                });
                let content = 'Hai ' + result.namaLengkap + ',' + ' ' + 'Your order have been ' + status;
                sendMessage(dataFilter, content, data);
            })
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