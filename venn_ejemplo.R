

library("VennDiagram")

set.seed(20)
datos<-data.frame(ID=1:41,tecnica1=sample(c(rep(1,39),0,0)),
tecnica2=sample(c(rep(1,40),0)),
tecnica3=sample(c(rep(1,11),rep(0,30))),stringsAsFactors=F)


A<-paste(datos$ID,datos$tecnica1,sep="_")

B<-paste(datos$ID,datos$tecnica2,sep="_")

C<-paste(datos$ID,datos$tecnica3,sep="_")


venn.plot <- venn.diagram( list(Tecnica1 = A, Tecnica2 = B, Tecnica3=C),
 "Venn.tiff")



