import * as functions from "firebase-functions";
import { HttpsError } from "firebase-functions/v1/auth";
import { StreamChat } from "stream-chat";
import { config } from "../config/config";

export const addUserToChannel = functions.region('asia-south1')
    .https
    .onCall(async (data, context) => {
        const channelId = data['channelId'];
        const userId = data['userId'];
        
        // const ownerId = context.auth?.uid;

        if (!config.streamApiKey || !config.streamApiSecret) throw new HttpsError("invalid-argument", "No API Config key or secret found for Stream API");

        try {

            const client = StreamChat.getInstance(config.streamApiKey!, config.streamApiSecret);
            const channel = client.channel('team', channelId);
            await channel.addMembers([userId]);
            
            functions.logger.info(`Member has been added to the Channel ${channelId}. User Id: ${userId}`);
            return {
                statusCode: 200,
                message: `User ${userId} has been successfully added to channel ${channelId} - ${channel}`
            };

        } catch (e) {
            functions.logger.error(`Error adding user to channel: ${channelId}. User: ${userId}`);
            throw new HttpsError('failed-precondition', `Failed to add user to the channel. ${e}`);
        }
    });