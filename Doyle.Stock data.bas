Attribute VB_Name = "Module2"
Sub First_One()

'Set an initial variable for holding the ticker
Dim ticker As String

'Set an initial variable for holding the total volume
Dim volume_total As Double
volume_total = 0

'Keep track of the location for each volume in the summary table
Dim summary_table_row As Integer
summary_table_row = 2

'Loop through all all ticker summary
'First initialize lastrow and colume
lastRow = Cells(Rows.Count, 1).End(xlUp).Row

For i = 2 To lastRow

'Check the same ticker
If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then

'Set the ticker
ticker = Cells(i, 1).Value

'Add to the ticker
ticker_total = Cells(i, 1).Value

'Add volume total
volume_total = volume_total + Cells(i, 7).Value


'Print the volume in the summary_table
Range("J" & summary_table_row).Value = ticker

'Print the ticker to the summary table
Range("K" & summary_table_row).Value = volume_total


'add one to the summary table row
summary_table_row = summary_table_row + 1

'Reset the ticker
volume_total = 0

'If the cells immediately follow a row is the same ticker...

Else

'Add to the volume total
volume_total = volume_total + Cells(i, 7).Value


End If

Next i

Range("J1").Value = "ticker"
Range("K1").Value = "volume total"
End Sub
