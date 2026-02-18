_G.SL_Material = _G.SL_Material or class()

-- PRIVATE

function SL_Material:init(name, bump_normal_texture, diffuse_texture, material_texture, reflection_texture)
    self._name = name
    self._bump_normal = bump_normal_texture
    self._diffuse = diffuse_texture
    self._material = material_texture
    self._reflection = reflection_texture
end

function SL_Material:name()
    return self._name
end

function SL_Material:bump_normal()
    return self._bump_normal
end

function SL_Material:diffuse()
    return self._diffuse
end

function SL_Material:material()
    return self._material
end

function SL_Material:reflection()
    return self._reflection
end

-- PUBLIC
