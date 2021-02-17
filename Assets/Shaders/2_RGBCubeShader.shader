Shader "Tutorial/2_RGBCubeShader"
{
	SubShader
	{ 
		Pass
		{
			CGPROGRAM 
			
			#pragma vertex vert
			#pragma fragment frag
			
			// We need to define structures in order to control multiple parameters
            struct VertexInput
            {
				float4 pos : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float2 uv0 : TEXCOORD0;
            };
			
			struct VertexOutput
			{
				float4 pos : SV_POSITION;
				float4 col : TEXCOORD0;
			};		
			
			VertexOutput vert(VertexInput input) 
			{
				// Here the vertex shader writes output data to the output structure.
				// We add 0.5 to the color, because the coordinates of the cube are between -0.5 and 0.5, but we want values between 0-1
				// So we need to normalize them
				VertexOutput output;
				output.pos = UnityObjectToClipPos(input.pos);
				output.col = input.pos + float4(0.5, 0.5, 0.5, 0.0);
				return output;
			}
			
			float4 frag(VertexOutput output) : COLOR
			{
			   // Here the fragment shader returns the "col" input parameter with semantic TEXCOORD0 as nameless output parameter with semantic COLOR.
			   return output.col; 
			}
			
			ENDCG  
		}
	}
}
