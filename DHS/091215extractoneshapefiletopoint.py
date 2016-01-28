# Jay Sayre - Extract ONE municipality polygons/information to DHS CLUSTERS
import arcpy

base_dir = "D:\\Dropbox\\Dropbox (Personal)\\College\\DR_Paper\\"

municipality_map = base_dir + "GIS\\ShapeFilesCenso2010\\MUNCenso2010.shp"
input_shp_2007 =  base_dir + "DHS\\2007Standard\\geo\\DRGE52FL.shp"
output_shp_2007 = base_dir + "DHS\\2007Standard\\geo\\merge2007clust.shp"
input_shp_2013 =  base_dir + "DHS\\2013Standard\\geo\\DRGE61FL.shp"
output_shp_2013 = base_dir + "DHS\\2013Standard\\geo\\merge2013clust.shp"

# Use spatial join to extract polygon municipality information to each DHS cluster
arcpy.SpatialJoin_analysis(input_shp_2007, municipality_map, output_shp_2007, "JOIN_ONE_TO_MANY", "KEEP_ALL","", "CLOSEST", "", "")
arcpy.SpatialJoin_analysis(input_shp_2013, municipality_map, output_shp_2013, "JOIN_ONE_TO_MANY", "KEEP_ALL","", "CLOSEST", "", "")

#Test to see if other map is more accurate - delete this later
#test_mun_map = base_dir + "GIS\\DOM_adm2.shp" #Test to see if this is more accurate
#test_shp_2007 = base_dir + "DHS\\2007Standard\\geo\\TEST2007clust.shp"
#arcpy.SpatialJoin_analysis(input_shp_2007, test_mun_map, test_shp_2007, "JOIN_ONE_TO_MANY", "KEEP_ALL","", "CLOSEST", "", "")
