#Constructing a phyloseq object for fungi
Fungi_otu_mat <- as.matrix(Fungi %>%
                            tibble::column_to_rownames("OTUs")) 
Fungi_tax_mat <- as.matrix(Fungi_tax %>% 
                            tibble::column_to_rownames("OTUs"))
metadata_df <- Metadata%>% 
  tibble::column_to_rownames("samples") 
OTU = otu_table(Fungi_otu_mat, taxa_are_rows = TRUE)
TAX = tax_table(Fungi_tax_mat)
samples = sample_data(metadata_df)
#phyloseq object
FungiPhylo <- phyloseq(OTU, TAX, samples)
FungiPhylo
#rarefaction
sample_sums_Fungi <- sample_sums(FungiPhylo)
rare_samp_Fungi <- min(sample_sums_Fungi)
# Rarefy to lowest sample depth
FungiRar <- rarefy_even_depth(FungiPhylo, rare_samp_Fungi)
FungiRar 
################################
#Constructing a phyloseq object for Protist
Protist_otu_mat <- as.matrix(Prot %>%
                             tibble::column_to_rownames("OTUs")) 
Protist_tax_mat <- as.matrix(Prot_tax %>% 
                             tibble::column_to_rownames("OTUs"))
metadata_df <- Metadata%>% 
  tibble::column_to_rownames("samples") 
OTU = otu_table(Protist_otu_mat, taxa_are_rows = TRUE)
TAX = tax_table(Protist_tax_mat)
samples = sample_data(metadata_df)
#phyloseq object
ProtistPhylo <- phyloseq(OTU, TAX, samples)
ProtistPhylo
#rarefaction
sample_sums_Protist <- sample_sums(ProtistPhylo)
rare_samp_Protist <- min(sample_sums_Protist)
# Rarefy to lowest sample depth
ProtistRar <- rarefy_even_depth(ProtistPhylo, rare_samp_Protist)
ProtistRar 