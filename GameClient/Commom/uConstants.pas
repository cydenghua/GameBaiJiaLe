unit uConstants;

interface

uses Winapi.Messages;

const MESSAGE_FLAG_BEGIN = 1;

const WM_MESSAGE_NEW_MESSAGE = WM_USER + 1001;
const WM_MESSAGE_SEND_MESSAGE = WM_USER + 1002;

const SCORE_ADD = 1;              //�Ϸ�
const SCORE_DEC = -1;             //�·�
const SCORE_GIVE = 2;             //�ͷ�
const SCORE_TRANS_IN = 3;         //ת��
const SCORE_TRANS_OUT = -3;       //ת��


implementation

end.
