Shader "Tutorial/1_MinimalShader"
{
	Properties
	{
		// We define properties here than can be assigned in the material to adjust output
		_Color ("Color", Color) = (1, 0, 0, 1)
	}
	SubShader
    {
		Pass
        {
			CGPROGRAM // Here begins the part in Unity's Cg

			#pragma vertex vert 		// specifies the vert function as the vertex shader 
			#pragma fragment frag		// specifies the frag function as the fragment shader
			
			float4 _Color;
			 
			// Vertex shader
			float4 vert(float4 vertexPos : POSITION) : SV_POSITION 		
			{
				// Use in-built Unity method to transform the vertex input parameter and return it as a nameless vertex output parameter (with semantic SV_POSITION)
				return UnityObjectToClipPos(vertexPos);
			}
			
			// Fragment shader
			float4 frag(void) : COLOR
			{
				// Return a nameless fragment output parameter (with semantic COLOR) that is set to the specified RGBA color value
				return _Color; 
			}

			ENDCG // here ends the part in Cg 
        }
    }
}
