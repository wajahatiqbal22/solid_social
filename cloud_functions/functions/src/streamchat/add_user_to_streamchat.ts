import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import { StreamChat } from "stream-chat";
import { config } from "../config/config";



export const addUserToStreamchat = functions.region('asia-south1')
    .https
    .onCall(async (data, context) => {

        
        var userId = context.auth?.uid;

        if (!userId) {
            userId = data["userId"];
            if (!userId) throw new HttpsError("unauthenticated", "Permission denied. Unauthenticated call to cloud function.");
        }

        if (!config.streamApiKey || !config.streamApiSecret) throw new HttpsError("invalid-argument", "No API Config key or secret found for Stream API");


        const firstName = data["firstName"];
        const lastName = data["lastName"];

        if (!config.streamApiKey || !config.streamApiSecret) {
            throw new HttpsError("failed-precondition", "No configuration found for Stream API.");
        }

        const client = StreamChat.getInstance(config.streamApiKey, config.streamApiSecret);
        const response = await client.queryUsers({id: userId});
        functions.logger.info(response);
        
        if (response.users.length == 0) {

            await client.upsertUser({
                id: userId!,
                role: "user",
                name: `${firstName} ${lastName}`,
            })
        }


        return { statusCode: 200, response };
    });