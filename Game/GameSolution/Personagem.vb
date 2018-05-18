Public Class Personagem

    Private Shared Name As String            'nome do pet virtual
    Private Shared Happy As Integer = 50     'barra de felicidade
    Private Shared Hunger As Integer = 30    'barra de fome
    Private Shared Health As Integer = 100   'barra de saude
    Private Shared Energy As Integer = 95    'barra de saude

    Private Shared Sick As Integer = 30            'precisa se curar (cure)
    Private Shared Tired As Integer = 30           'precisa dormir (sleep)
    Private Shared Dirty As Integer = 30           'precisa se limpar (flush)
    Private Shared Sad As Integer = 30             'precisa brincar (play)
    Private Shared Sleeping As Boolean = False     'pode dormir ou acordar a qualquer momento (+health -hunger)

    Private Dead As Boolean                 'recomeçar o pet



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

    Public Function GetEnergy()
        Return Energy
    End Function

    Public Function SetEnergy(ByRef value_energy)
        Energy = value_energy
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
