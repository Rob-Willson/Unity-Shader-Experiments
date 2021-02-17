Shader "Unlit/SimpleShader"
{
    Properties
    {
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

			// Mesh data (vertex positions/normals/UVs/tangents/colors)
            struct VertexInput
            {
                float4 vertex : POSITION;
				float2 uv0 : TEXCOORD0;
            };

            struct VertexOutput
            {
                float4 clipSpacePosition : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };

            //sampler2D _MainTex;
            //float4 _MainTex_ST;

			// Vertex shader
			VertexOutput vert (VertexInput v)
            {
				VertexOutput o;
                o.clipSpacePosition = UnityObjectToClipPos(v.vertex);
                return o;
            }

            fixed4 frag (VertexOutput o) : SV_Target
            {
                return float4(1,1,1,0);
            }
            ENDCG
        }
    }
}
