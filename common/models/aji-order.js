'use strict';

module.exports = function (Ajiorder) {
    let request = require('request');
    let app = require('../../server/server');

    Ajiorder.observe('after save', function (ctx, next) {
        console.log('Order', ctx.instance);
        if (ctx.instance.id == undefined || ctx.instance == null) {
            return
        } else {
            let postingModel = app.models.AjiPosting;
            let userAuth = app.models.AjiUserAuth;

            postingModel.find({
                where:
                { id: ctx.instance.id }
            }, function (err, success) {
                console.log(success, 'SUKSES');
                if (ctx.instance) {
                    let dataFilter = [];
                    dataFilter.push({
                        'field': 'tag',
                        'key': 'userid',
                        'relation': '=',
                        'value': ctx.instance.idSeller
                    });
                    console.log(ctx.instance.idSeller, 'ID TOT')
                    console.log(dataFilter, 'dataFilter');

                    let data = {
                        idSeller: ctx.instance.idSeller
                    }
                    console.log(data, 'Data');
                    userAuth.find({
                        where:
                        { id: ctx.instance.idCustomer }
                    }, function (err, result) {
                        console.log(result, 'Data Personal');

                        let content = result[0].namaLengkap + ' ' + 'Order your product';
                        console.log(content, 'Nama Order');
                        console.log(ctx.instance.idSeller, 'My Dream', success[0].id);
                        if (ctx.instance.id != success[0].id) {
                            console.log('Spirit');
                            sendMessage(dataFilter, content, data);
                        }
                    })
                }
                next();
            });
        }
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