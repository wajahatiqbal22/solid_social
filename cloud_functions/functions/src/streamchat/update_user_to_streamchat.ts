import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import { StreamChat } from "stream-chat";
import { config } from "../config/config";



export const updateUserToStreamchat = functions.region('asia-south1')

    .firestore.document('users/{userId}').onUpdate(async (change, context) => {


        const user = change.after.data();


        if (!config.streamApiKey || !config.streamApiSecret) throw new HttpsError("invalid-argument", "No API Config key or secret found for Stream API");
        
        const client = StreamChat.getInstance(config.streamApiKey, config.streamApiSecret);
        const profileUrl = user.userDetails.profileUrl;
        try {
            const update = {
                id: user.uid,
                set: {
                    'userData': JSON.parse(JSON.stringify(user)),
                    image: profileUrl,
                    name: `${user.firstName} ${user.lastName}`,
                }
            };
            await client.partialUpdateUser(update);
            functions.logger.info(`Successfully updated user: ${user.uid} to streamchat.`);

        } catch (e) {
            functions.logger.error('An error occurred while updating user to streamchat.');
            functions.logger.error(e);
        }


    });