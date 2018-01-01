# Source: https://gist.github.com/nygeog/2731427a74ed66ca0e420eaa7bcd0d2b

# python v3.5.2
import pandas as pd                 # version 0.21.1
from geopandas import GeoDataFrame  # version 0.3.0
from shapely.geometry import Point  # version 1.6.3

df = pd.read_csv('data.csv')

geometry = [Point(xy) for xy in zip(df.x, df.y)]
crs = {'init': 'epsg:2263'} #http://www.spatialreference.org/ref/epsg/2263/
geo_df = GeoDataFrame(df, crs=crs, geometry=geometry)

geo_df.to_file(driver='ESRI Shapefile', filename='data.shp')

# https://gis.stackexchange.com/questions/204201/geopandas-to-file-saves-geodataframe-without-coordinate-system
# http://geopandas.org/io.html#writing-spatial-data
# https://gis.stackexchange.com/questions/174159/convert-a-pandas-dataframe-to-a-geodataframe
