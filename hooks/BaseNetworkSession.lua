
Hooks:Add("BaseNetworkSessionOnLoadComplete", "SkinLib_BaseNetworkSessionOnLoadComplete",
    function(local_peer, id)
        if SkinLib.Sync and LuaNetworking:IsMultiplayer() and Network:is_client() then
            -- client handshake request to all clients
            SkinLib.Sync:send_to_peers(true, SkinLib.Sync.events.handshake,
                { version = SkinLib.Sync.protocol_version })
        end
    end
)

Hooks:PostHook(BaseNetworkSession, "on_peer_sync_complete", "SkinLib_BaseNetworkSession_on_peer_sync_complete",
    function(self, peer, peer_id)
        if SkinLib.Sync and Network:is_server() and self._local_peer and peer:ip_verified() then
            -- send cached data to dop in client
            SkinLib.Sync:handle_drop_in(peer_id)
        end
    end
)

Hooks:Add("BaseNetworkSessionOnPeerRemoved", "SkinLib_BaseNetworkSessionOnPeerRemoved",
    function(peer, peer_id, reason)
        if SkinLib.Sync then
            -- reset handshake
            SkinLib.Sync:reset_peer(peer_id)
        end
    end
)

Hooks:Add("NetworkReceivedData", "SkinLib_NetworkReceivedData",
    function(sender, tags, data)
        if SkinLib.Sync then
            SkinLib.Sync:receive(sender, tags, data)
        end
    end
)
