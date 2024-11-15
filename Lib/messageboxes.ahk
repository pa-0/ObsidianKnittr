﻿AppError(Title, Message, Options := 0x0010, TitlePrefix := " - Error occured: ",Timeout:=0) {
    static labels := StrSplit("Abort,Cancel,Continue,Ignore,No,OK,Retry,TryAgain,Yes", ",")
    Options |= 0x1000 ;; force system modal

    if (Timeout) {
        MsgBox % Options, % script.name TitlePrefix Title, % Message, % Timeout
    } else {
        MsgBox % Options, % script.name TitlePrefix Title, % Message
    }
    for _, label in labels {
        IfMsgBox % label, return label
    }
}
