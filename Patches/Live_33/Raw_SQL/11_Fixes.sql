-- Remove extra head slot from Seth mk1

UPDATE entitydefaults SET options = '#height=f0.01#slotFlags=48,8,8,8,8,8' WHERE definitionname = 'def_seth_head'

GO