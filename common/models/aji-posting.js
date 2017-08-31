'use strict';

module.exports = function (Ajiposting) {

    Ajiposting.observe('after save', function (ctx, next) {

        if (ctx.instance) {
            var sendNotification = function (data) {
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
            };

            var message = {
                app_id: "c36cc157-3385-48fa-a4e1-e705aebb60db",
                contents: { "en": "Some seller has been posted new product!" },
                included_segments: ["All"]
            };

            sendNotification(message);
        } else {
            console.log('Updated %s matching %j',
                ctx.Model.pluralModelName,
                ctx.where);
        }
        next();
    });
};
