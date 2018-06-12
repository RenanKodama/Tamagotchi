Public Class EfContext

    Inherits System.Data.Entity.DbContext

    Public Property Jogadores As System.Data.Entity.DbSet(Of Jogadores)

    Protected Overrides Sub OnModelCreating(modelBuilder As Entity.DbModelBuilder)
        MyBase.OnModelCreating(modelBuilder)
        modelBuilder.Conventions.Remove(Of System.Data.Entity.ModelConfiguration.Conventions.PluralizingTableNameConvention)()
    End Sub
End Class

