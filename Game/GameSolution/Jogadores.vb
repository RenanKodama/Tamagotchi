Public Class Jogadores
    Public Property player_id As Long
    Public Property player_name As String
    Public Property player_senha As String
    Public Property player_login As String

    Public Function setPlayerId(ByRef value_id)
        player_id = value_id
    End Function

    Public Function setName(ByRef value_name)
        player_name = value_name
    End Function

    Public Function setSenha(ByRef value_senha)
        player_senha = value_senha
    End Function
    Public Function setLogin(ByRef value_login)
        player_login = value_login
    End Function

    Public Function getLogin()
        Return player_login
    End Function

    Public Function getSenha()
        Return player_senha
    End Function

    Public Function getId()
        Return player_id
    End Function

    Public Function getName()
        Return player_name
    End Function
End Class
