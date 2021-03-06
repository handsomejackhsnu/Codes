VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8124
   ClientLeft      =   108
   ClientTop       =   432
   ClientWidth     =   11028
   LinkTopic       =   "Form1"
   ScaleHeight     =   8124
   ScaleWidth      =   11028
   StartUpPosition =   3  '系統預設值
   Begin VB.CommandButton Command3 
      Caption         =   "紅白摩天輪"
      Height          =   732
      Left            =   8520
      TabIndex        =   5
      Top             =   4920
      Width           =   1572
   End
   Begin VB.CommandButton Command2 
      Caption         =   "繽紛摩天輪"
      Height          =   732
      Left            =   8520
      TabIndex        =   4
      Top             =   3960
      Width           =   1572
   End
   Begin VB.CommandButton Command1 
      Caption         =   "圓周運動"
      Height          =   732
      Left            =   8520
      TabIndex        =   3
      Top             =   3000
      Width           =   1572
   End
   Begin VB.CommandButton Command4 
      Caption         =   "範例"
      Height          =   735
      Left            =   8400
      TabIndex        =   2
      Top             =   600
      Width           =   1695
   End
   Begin VB.Timer Timer3 
      Left            =   8160
      Top             =   5040
   End
   Begin VB.Timer Timer2 
      Left            =   10320
      Top             =   3840
   End
   Begin VB.Timer Timer1 
      Left            =   9720
      Top             =   2520
   End
   Begin VB.Label Label2 
      Height          =   495
      Left            =   8400
      TabIndex        =   1
      Top             =   2280
      Width           =   1095
   End
   Begin VB.Line Line3 
      X1              =   3600
      X2              =   6600
      Y1              =   6360
      Y2              =   6360
   End
   Begin VB.Image Image1 
      Height          =   1335
      Left            =   4320
      Picture         =   "02++.frx":0000
      Stretch         =   -1  'True
      Top             =   3240
      Width           =   1575
   End
   Begin VB.Label Label1 
      Height          =   492
      Left            =   8400
      TabIndex        =   0
      Top             =   1560
      Width           =   1212
   End
   Begin VB.Line Line1 
      BorderWidth     =   3
      X1              =   4920
      X2              =   3600
      Y1              =   4200
      Y2              =   6360
   End
   Begin VB.Line Line2 
      BorderWidth     =   3
      X1              =   5400
      X2              =   6600
      Y1              =   4320
      Y2              =   6360
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FF0000&
      BackStyle       =   1  '不透明
      BorderColor     =   &H00FFFF80&
      Height          =   2055
      Left            =   0
      Top             =   6120
      Width           =   11055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim r As Single

Private Sub Command1_Click()
    Timer2.Interval = 0
    Timer3.Interval = 0
    Timer1.Interval = 100
    r = 2000
    Label1 = 0
    Label2 = 0
End Sub

Private Sub Command2_Click()
    Timer1.Interval = 0
    Timer3.Interval = 0
    Timer2.Interval = 100
    r = 2000
    Label1 = 0
    Label2 = 0
End Sub

Private Sub Command3_Click()
    Timer1.Interval = 0
    Timer2.Interval = 0
    Timer3.Interval = 100
    r = 2000
    Label1 = 0
    Label2 = 0
    For i = 0 To 19
        Label1.Caption = (Label1.Caption + 1) Mod 20
        Me.DrawWidth = 3
        Me.FillStyle = vbFSSolid
        If Label1.Caption Mod 2 = 0 Then
            Me.FillColor = QBColor(15)
        Else
            Me.FillColor = QBColor(12)
        End If
        x = (Image1.Left + Image1.Width / 2) + r * Cos(i / 10 * 3.14) 'cos(n)，n的值由0-2PI
        y = (Image1.Top + Image1.Height / 2) + r * Sin(i / 10 * 3.14)
        Me.Circle (x, y), 200, vbBlack
        Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow
    Next
End Sub

Private Sub Timer1_Timer()
    Me.Cls
    Label1.Caption = (Label1.Caption + 1) Mod 20
    If Label1.Caption = 0 Then
        Label2.Caption = Label2.Caption + 1
    End If
    Me.DrawWidth = 3
    Me.FillStyle = vbFSSolid
    Me.FillColor = QBColor((Label1 + Label2) Mod 16)  'qbcolor(n)顏色陣列，n可以帶入0-15，共16種不同顏色
    
    x = (Image1.Left + Image1.Width / 2) + r * Cos(Label1 / 10 * 3.14) 'cos(n)，n的值由0-2PI
    y = (Image1.Top + Image1.Height / 2) + r * Sin(Label1 / 10 * 3.14)
    Me.Circle (x, y), 200, vbBlack
    Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow

End Sub
Private Sub Command4_Click()
    Timer1.Interval = 0
    Timer2.Interval = 0
    Timer3.Interval = 0
    Me.Cls  '清除表單
    Label1 = 0
    Label2 = 0
    r = 2000  '設定半徑2000px
    Me.DrawWidth = 3  '設定圓外線3px
    Me.FillStyle = vbFSSolid  '設定實心填色
    
    Me.FillColor = vbRed  '設定填色
    '圓心為愛心，以其中心點，半徑r，用sin,cos計算圓周運動座標
    x = (Image1.Left + Image1.Width / 2) + r * Cos(Label1 / 10 * 3.14)   'cos(n)，n的值由0-2PI
    y = (Image1.Top + Image1.Height / 2) + r * Sin(Label1 / 10 * 3.14)   'sin(n)，n的值由0-2PI
    '依照計算出來的圓周運動座標畫一個半徑200的小圓，最後面那個vbblack室外圈顏色，圓內色彩由fillcolor設定
    Me.Circle (x, y), 200, vbBlack
    '依照計算出來的圓周運動座標畫一條直線
    Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow
    
End Sub

Private Sub Timer2_Timer()
    Label1.Caption = (Label1.Caption + 1) Mod 20
    If Label1.Caption = 0 Then
        Label2.Caption = Label2.Caption + 1
    End If
    Me.DrawWidth = 3
    Me.FillStyle = vbFSSolid
    Me.FillColor = QBColor((Label1 + Label2) Mod 16)  'qbcolor(n)顏色陣列，n可以帶入0-15，共16種不同顏色
    
    x = (Image1.Left + Image1.Width / 2) + r * Cos(Label1 / 10 * 3.14) 'cos(n)，n的值由0-2PI
    y = (Image1.Top + Image1.Height / 2) + r * Sin(Label1 / 10 * 3.14)
    Me.Circle (x, y), 200, vbBlack
    Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow

End Sub

Private Sub Timer3_Timer()
    Label1.Caption = (Label1.Caption + 1) Mod 20
    If Label1.Caption = 0 Then
        Label2.Caption = Label2.Caption + 1
    End If
    If Label1 Mod 20 = 0 Then
    If Label2.Caption Mod 2 = 0 Then
        For i = 0 To 19
        Label1.Caption = (Label1.Caption + 1) Mod 20
        Me.DrawWidth = 3
        Me.FillStyle = vbFSSolid
        If Label1.Caption Mod 2 = 0 Then
            Me.FillColor = QBColor(15)
        Else
            Me.FillColor = QBColor(12)
        End If
        x = (Image1.Left + Image1.Width / 2) + r * Cos(i / 10 * 3.14) 'cos(n)，n的值由0-2PI
        y = (Image1.Top + Image1.Height / 2) + r * Sin(i / 10 * 3.14)
        Me.Circle (x, y), 200, vbBlack
        Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow
    Next
    Else
    For i = 0 To 19
        Label1.Caption = (Label1.Caption + 1) Mod 20
        Me.DrawWidth = 3
        Me.FillStyle = vbFSSolid
        If Label1.Caption Mod 2 = 0 Then
            Me.FillColor = QBColor(12)
        Else
            Me.FillColor = QBColor(15)
        End If
        x = (Image1.Left + Image1.Width / 2) + r * Cos(i / 10 * 3.14) 'cos(n)，n的值由0-2PI
        y = (Image1.Top + Image1.Height / 2) + r * Sin(i / 10 * 3.14)
        Me.Circle (x, y), 200, vbBlack
        Line ((Image1.Left + Image1.Width / 2), (Image1.Top + Image1.Height / 2))-(x, y), vbYellow
    Next
    End If
    End If
End Sub
