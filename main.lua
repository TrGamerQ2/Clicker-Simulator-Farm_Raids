local function b64decode(s)
    local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local o = ""
    for i = 1, #s, 4 do
        local c1, c2, c3, c4 = s:sub(i,i), s:sub(i+1,i+1), s:sub(i+2,i+2), s:sub(i+3,i+3)
        if c1 ~= "" and c2 ~= "" and c1 ~= "=" and c2 ~= "=" then
            local n = (b:find(c1)-1) * 262144 + (b:find(c2)-1) * 4096
            if c3 ~= "" and c3 ~= "=" then
                n = n + (b:find(c3)-1) * 64
                o = o .. string.char(math.floor(n / 65536))
                o = o .. string.char(math.floor(n / 256) % 256)
                if c4 ~= "" and c4 ~= "=" then
                    o = o .. string.char(n % 256)
                end
            end
        end
    end
    return o
end

loadstring(b64decode("bG9jYWwgc3RvcCA9IGZhbHNlCgpnYW1lOkdldFNlcnZpY2UoIlVzZXJJbnB1dFNlcnZpY2UiKS5JbnB1dEJlZ2FuOkNvbm5lY3QoZnVuY3Rpb24oaW5wdXQsIGdwKQogICAgaWYgZ3AgdGhlbiByZXR1cm4gZW5kCiAgICBpZiBpbnB1dC5LZXlDb2RlID09IEVudW0uS2V5Q29kZS5GMyB0aGVuCiAgICAgICAgc3RvcCA9IHRydWUKICAgICAgICBwcmludCgi0KHQotCe0J8iKQogICAgZW5kCmVuZCkKCndoaWxlIG5vdCBzdG9wIGRvCmxvY2FsIFZJTSA9IGdhbWU6R2V0U2VydmljZSgiVmlydHVhbElucHV0TWFuYWdlciIpClZJTTpTZW5kTW91c2VCdXR0b25FdmVudCg5NTAsIDY2NywgMCwgdHJ1ZSwgZ2FtZSwgMCkKd2FpdCgwLjMpClZJTTpTZW5kTW91c2VCdXR0b25FdmVudCg5NTAsIDY2NywgMCwgZmFsc2UsIGdhbWUsIDApCnByaW50KCLQmtC70LjQutC90YPQuyAoOTUwLCA2NjcpIikgICAKd2FpdCgwLjQpCmxvY2FsIFZJID0gZ2FtZTpHZXRTZXJ2aWNlKCJWaXJ0dWFsSW5wdXRNYW5hZ2VyIikKVkk6U2VuZE1vdXNlQnV0dG9uRXZlbnQoNjM5LCA2NzksIDAsIHRydWUsIGdhbWUsIDApCndhaXQoMC4zKQpWSTpTZW5kTW91c2VCdXR0b25FdmVudCg2MzksIDY3OSwgMCwgZmFsc2UsIGdhbWUsIDApCnByaW50KCLQmtC70LjQutC90YPQuyAoNjM5LCA2NzkiKSAgCndhaXQoMykKCgpsb2NhbCBwbGF5ZXIgPSBnYW1lLlBsYXllcnMuTG9jYWxQbGF5ZXIKbG9jYWwgY2FtZXJhID0gd29ya3NwYWNlLkN1cnJlbnRDYW1lcmEKCmxvY2FsIGZ1bmN0aW9uIGdldEhycCgpCiAgICBsb2NhbCBjaGFyID0gcGxheWVyLkNoYXJhY3RlcgogICAgaWYgbm90IGNoYXIgdGhlbiByZXR1cm4gbmlsIGVuZAogICAgcmV0dXJuIGNoYXI6RmluZEZpcnN0Q2hpbGQoIkh1bWFub2lkUm9vdFBhcnQiKQplbmQKCndoaWxlIG5vdCBnZXRIcnAoKSBkbyB3YWl0KDAuMSkgZW5kCgpsb2NhbCByb29tcyA9IHdvcmtzcGFjZS5fVEhJTkdTLk1pbmlnYW1lcy5SYWlkTG9iYnkuUm9vbXMKCmZvciBpID0gMSwgNiBkbwogICAgbG9jYWwgZ2F0ZSA9IHJvb21zW2ldLkdhdGVbdG9zdHJpbmcoMSldCiAgICBpZiBnYXRlIHRoZW4KICAgICAgICBsb2NhbCBocnAgPSBnZXRIcnAoKQogICAgICAgIGhycC5DRnJhbWUgPSBnYXRlLkNGcmFtZSArIFZlY3RvcjMubmV3KDAsIDMsIDApCiAgICAgICAgY2FtZXJhLkNGcmFtZSA9IENGcmFtZS5sb29rQXQoaHJwLlBvc2l0aW9uICsgVmVjdG9yMy5uZXcoMCwgMywgMCksIGdhdGUuUG9zaXRpb24pCiAgICAgICAgcHJpbnQoItCi0J8g0LogR2F0ZSAiIC4uIGkpCiAgICBlbmQKICAgIHdhaXQoMS4yKQplbmQKCi0tINCi0J8g0LogRG9vcjEKbG9jYWwgZG9vciA9IHdvcmtzcGFjZS5fVEhJTkdTLk1pbmlnYW1lcy5SYWlkTG9iYnkuSW50ZXJhY3Q6R2V0Q2hpbGRyZW4oKVs0XS5TaGFkb3cKICAgIGlmIGRvb3IgdGhlbgogICAgICAgIGxvY2FsIGhycCA9IGdldEhycCgpCiAgICAgICAgaHJwLkNGcmFtZSA9IGRvb3IuQ0ZyYW1lCiAgICAgICAgY2FtZXJhLkNGcmFtZSA9IENGcmFtZS5sb29rQXQoaHJwLlBvc2l0aW9uICsgVmVjdG9yMy5uZXcoMCwgMywgMCksIGRvb3IuUG9zaXRpb24pCiAgICAgICAgcHJpbnQoItCi0J8g0LogRG9vcjEiKQogICAgZW5kCgogICAgcHJpbnQoItCT0L7RgtC+0LLQviIpCiAgICB3YWl0KDMpCmVuZA=="))()  
