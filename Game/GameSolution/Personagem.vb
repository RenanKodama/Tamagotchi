Public Class Personagem

    Private Name As String          'nome do pet virtual
    Private Happy As Integer        'barra de felicidade
    Private Hunger As Integer       'barra de fome
    Private Health As Integer       'barra de saude

    Private Sick As Integer         'precisa se curar (cure)
    Private Tired As Integer        'precisa dormir (sleep)
    Private Dirty As Integer        'precisa se limpar (flush)
    Private Sad As Integer          'precisa brincar (play)
    Private Sleeping As Boolean     'pode dormir ou acordar a qualquer momento (+health -hunger)

    Private Dead As Boolean         'recomeçar o pet


    'criaçao do construtor
    Public Sub New(ByVal name_pet)
        Name = name_pet
        Happy = 100
        Hunger = 100
        Health = 100

        Sick = 30
        Tired = 30
        Dirty = 30
        Sad = 30
        Sleeping = 30

        Dead = False
    End Sub

    'funçoes de getters e setters
    Public Function GetName()
        Return Name
    End Function

    Public Function GetHappy()
        Return Happy
    End Function

    Public Function SetHappy(ByVal value_happy)
        Happy = value_happy
    End Function

    Public Function GetHunger()
        Return Hunger
    End Function

    Public Function SetHunger(ByVal value_hunger)
        Hunger = value_hunger
    End Function

    Public Function GetHealth()
        Return Health
    End Function

    Public Function SetHealth(ByVal value_health)
        Health = value_health
    End Function

    Public Function GetSick()
        Return Sick
    End Function

    Public Function SetSick(ByVal value_Sick)
        Sick = value_Sick
    End Function

    Public Function GetTired()
        Return Tired
    End Function

    Public Function SetTired(ByVal value_tired)
        Tired = value_tired
    End Function

    Public Function GetDirty()
        Return Dirty
    End Function

    Public Function SetDirty(ByVal value_dirty)
        Dirty = value_dirty
    End Function

    Public Function GetSad()
        Return Sad
    End Function

    Public Function SetSad(ByVal value_sad)
        Sad = value_sad
    End Function

    Public Function GetSleeping()
        Return Sleeping
    End Function

    Public Function SetSleeping(ByVal value_sleeping)
        Sleeping = value_sleeping
    End Function

    Public Function GetDead()
        Return Dead
    End Function

    Public Function SetDead(ByVal value_dead)
        Dead = value_dead
    End Function
End Class
